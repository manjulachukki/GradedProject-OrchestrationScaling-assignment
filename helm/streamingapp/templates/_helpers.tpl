{{- define "streamingapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "streamingapp.fullname" -}}
{{- printf "%s" (include "streamingapp.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "streamingapp.labels" -}}
app.kubernetes.io/name: {{ include "streamingapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "streamingapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "streamingapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
