from grafanalib.core import Dashboard
from grafanalib._gen import DashboardEncoder
import json
import requests
from os import getenv

from grafanalib.core import (
    Dashboard, TimeSeries, GaugePanel,
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
    response = requests.post(url, auth=auth, data=dashboard_json, headers=headers)
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
            title="Random Walk",
            dataSource='default',
            targets=[
                Target(
                    datasource='grafana',
                    expr='example',
                ),
            ],
            gridPos=GridPos(h=8, w=16, x=0, y=0),
        ),
        GaugePanel(
            title="Random Walk",
            dataSource='default',
            targets=[
                Target(
                    datasource='grafana',
                    expr='example',
                ),
            ],
            gridPos=GridPos(h=4, w=4, x=17, y=0),
        ),
        TimeSeries(
            title="Prometheus http requests",
            dataSource='Prometheus',
            targets=[
                Target(
                    expr='rate(envoy_cluster_external_upstream_rq[5m])',
                    legendFormat="{{ handler }}",
                    refId='A',
                ),
            ],
            unit=OPS_FORMAT,
            gridPos=GridPos(h=8, w=16, x=0, y=10),
        ),
    ],
)
my_dashboard_json = get_dashboard_json(my_dashboard, overwrite=True)
upload_to_grafana(my_dashboard_json, url)