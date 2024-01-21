[web_db]
%{ for ip in web_db ~}
${ip}
%{ endfor ~}

[envoy]
${envoy}


[observability]
${observability}

[docker]
%{ for ip in web_db ~}
${ip}
%{ endfor ~}
${envoy}
${observability}
