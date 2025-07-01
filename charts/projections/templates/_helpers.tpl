{{- define "fraeym.dockerconfig" -}}
{{- $username := .Values.github.username | default .Values.global.github.username -}}
{{- $token := .Values.github.token | default .Values.global.github.token -}}
{{- $secret := printf "%s:%s" $username $token -}}
{{- $secretBase64 := $secret | b64enc -}}
{{- printf "{\"auths\":{\"ghcr.io\":{\"auth\":\"%s\"}}}" $secretBase64 | b64enc -}}
{{- end }}
