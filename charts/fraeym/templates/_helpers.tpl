{{- define "fraeym.dockerconfig" -}}
{{- $secret := printf "%s:%s" .Values.ghcr.username .Values.ghcr.token -}}
{{- $secretBase64 := $secret | b64enc -}}
{{- printf "{\"auths\":{\"ghcr.io\":{\"auth\":\"%s\"}}}" $secretBase64 | b64enc -}}
{{- end }}
