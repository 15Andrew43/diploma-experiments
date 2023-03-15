[web_db]
%{ for ip in web_db ~}
${ip}
%{ endfor ~}

[envoy]
${envoy}