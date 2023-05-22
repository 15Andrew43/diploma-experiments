from grafanalib.core import Dashboard
from grafanalib._gen import DashboardEncoder
import json
import requests
from os import getenv

from grafanalib.core import (
    Dashboard, TimeSeries, GaugePanel, Stat,
    Target, GridPos,
    OPS_FORMAT
)

url = "http://localhost:3000/api/dashboards/db"
auth = ('admin', 'mysecretpassword')
headers = {'Content-Type': 'application/json'}


def get_dashboard_json(dashboard, overwrite=False, message="Updated by grafanlib"):
    return json.dumps(
        {
            "dashboard": dashboard.to_json_data(),
            "overwrite": overwrite,
            "message": message
        }, sort_keys=True, indent=2, cls=DashboardEncoder)


def upload_to_grafana(dashboard_json, url, verify=True):
    response = requests.post(
        url, auth=auth, data=dashboard_json, headers=headers)
    print(f"{response.status_code} - {response.content}")


my_dashboard = dashboard = Dashboard(
    title="Python generated example dashboard",
    description="Example dashboard using the Random Walk and default Prometheus datasource",
    tags=[
        'example'
    ],
    timezone="browser",
    panels=[
        TimeSeries(
            title="Number of requests per minute",
            dataSource='Prometheus',
            targets=[
                Target(
                    expr='rate(envoy_cluster_upstream_rq_total[1m])',
                    legendFormat="{{ handler }}",
                    refId='A',
                ),
            ],
            unit=OPS_FORMAT,
            gridPos=GridPos(h=8, w=16, x=0, y=10),
        ),
        TimeSeries(
            title="Number of all requests",
            dataSource='Prometheus',
            targets=[
                Target(
                    expr='envoy_cluster_upstream_rq_total',
                    legendFormat="{{ handler }}",
                    refId='A',
                ),
            ],
            gridPos=GridPos(h=8, w=16, x=0, y=10),
        ),
        TimeSeries(
            title="Number XXX respose code",
            dataSource='Prometheus',
            # graphMode='none',
            targets=[
                Target(
                    expr='envoy_cluster_external_upstream_rq',
                    legendFormat="{{ handler }}",
                    refId='A',
                ),
            ],
            gridPos=GridPos(h=8, w=16, x=0, y=10),
            scaleDistributionType="log"
        )
    ]
)
my_dashboard_json = get_dashboard_json(my_dashboard, overwrite=True)
upload_to_grafana(my_dashboard_json, url)
