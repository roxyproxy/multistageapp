FROM python:3.7-slim as stage1
WORKDIR /app
RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice

FROM stage1 AS stage2
RUN pip install networkx dash plotly
COPY . .

FROM stage2 AS stage3
USER webservice:webservice
EXPOSE 8050
CMD ["python", "GraphAnalysis.py", "obj_dependency_data.csv"]
