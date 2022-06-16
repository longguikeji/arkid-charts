{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "arkid.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "arkid.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "arkid.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
# {{- printf "%s-mysql" (include "arkid.fullname" .) | trunc 63 | trimSuffix "-" -}}
*/}}

{{- define "arkid.mysql.fullname" -}}
{{- if eq .Values.mysql.architecture "replication" }}
{{- printf "%s-mysql-%s" (include "arkid.fullname" .) "primary" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-mysql" (include "arkid.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{/*
Return the mysql Hostname
*/}}
{{- define "arkid.databaseHost" -}}
{{- if .Values.mysql.enabled }}
        {{- printf "%s" (include "arkid.mysql.fullname" .) -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.host -}}
{{- end -}}
{{- end -}}

{{/*
Return the mysql Port
*/}}
{{- define "arkid.databasePort" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "3306" -}}
{{- else -}}
    {{- printf "%d" (.Values.externalDatabase.port | int ) -}}
{{- end -}}
{{- end -}}

{{/*
Return the mysql Database Name
*/}}
{{- define "arkid.databaseName" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" .Values.mysql.auth.database -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.database -}}
{{- end -}}
{{- end -}}

{{/*
Return the mysql User
*/}}
{{- define "arkid.databaseUser" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "root" -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.user -}}
{{- end -}}
{{- end -}}

{{/*
Return the mysql password
*/}}
{{- define "arkid.databasePassword" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" .Values.mysql.auth.rootPassword -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.password -}}
{{- end -}}
{{- end -}}


{{/*
Return the redis fullname
*/}}
{{- define "arkid.redis.fullname" -}}
{{- printf "%s-redis-master" (include "arkid.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the redis Hostname
*/}}
{{- define "arkid.redisHost" -}}
{{- if .Values.redis.enabled }}
        {{- printf "%s" (include "arkid.redis.fullname" .) -}}
{{- else -}}
    {{- printf "%s" .Values.externalRedis.host -}}
{{- end -}}
{{- end -}}

{{/*
Return the redis port
*/}}
{{- define "arkid.redisPort" -}}
{{- if .Values.redis.enabled }}
    {{- printf "6379" -}}
{{- else -}}
    {{- printf "%d" (.Values.externalRedis.port | int ) -}}
{{- end -}}
{{- end -}}

{{/*
Return the redis db
*/}}
{{- define "arkid.redisDB" -}}
{{- if .Values.redis.enabled }}
    {{- printf "0" -}}
{{- else -}}
    {{- printf "%d" (.Values.externalRedis.db | int ) -}}
{{- end -}}
{{- end -}}

{{/*
Return https 1 or 0
*/}}
{{- define "httpsorNot" -}}
{{- if .Values.ingress.tls }}
        {{- printf "%d" 1 -}}
{{- else -}}
    {{- printf "%d" 0 -}}
{{- end -}}
{{- end -}}
