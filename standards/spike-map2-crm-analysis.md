# Technical Spike: Research Current and Future State of ADF Pipeline D365-PZMIGRATION-D for MAP 2.0 to CRM Alignment Sync

## Purpose
This prompt guides an AI assistant (e.g., Grok, GPT-5, or any LLM) to perform a Technical Spike, formatted as a User Story, to analyze the current state of the Azure Data Factory (ADF) pipeline `D365-PZMIGRATION-D` and propose a future state approach for supporting MAP 2.0 to CRM alignment sync in the Food and Beverage (F&B) "One Customer" initiative. The spike leverages discovery service meeting insights and existing code in the ADF repository to document activities, data sources, mappings, transformations, and Azure Data Lake staging, while addressing new requirements for Base Customer Account (BCA) aggregation, Sales Skill mappings, District handling, and market/sub-segment (SINC) needs. The output is a structured Markdown report, suitable for VS Code extensions like Continue.dev or CodeGPT, and maps to Azure DevOps Work Items for tracking.

## Instructions
Follow these steps to conduct a time-boxed (4-8 hour) Technical Spike, using tools like `web_search` and `code_execution` for research and code analysis. Output in GitHub-flavored Markdown (GFM) with proper code block fencing (e.g., ```python).

### 1. Summarize Discovery Service Meeting Insights
- **Action**: Review provided meeting recaps (e.g., "CRM Dynamics - Discovery Sessions" from July 23-24, 2025, or "F&B United CRM.pdf") or user-provided summaries to extract requirements for MAP 2.0 to CRM sync. Focus on:
  - Account-to-user alignments (e.g., SAM, BDM/DM roles).
  - District alignments and territory/hierarchy mappings for F&B and Nalco Water.
  - Sales Skill ownership by BCA and sold-to.
  - Future extensions (e.g., CAM/AVP roles).
  - Validation needs: No duplicate alignments, preserve manual assignments.
- **AI Guidance**: If recaps are unavailable, prompt the user for snippets or use `web_search` (query: "CRM Dynamics integration with ADF 2025") to infer requirements. Summarize findings in a concise paragraph (100-150 words).
- **Output**: Markdown section titled "Meeting Insights" with bullet points of key requirements.

### 2. Analyze Existing ADF Pipeline Code
- **Action**: Develop a Python script to parse the ADF repo (assumed in `adf_publish` or similar) for `D365-PZMIGRATION-D` pipeline details, focusing on:
  - Activities (e.g., Copy, Data Flow) in pipeline JSON.
  - Data sources (e.g., Snowflake views from EBS/NSAP in datasets).
  - Mappings/transformations (e.g., derived columns in dataflows).
  - Staging in Azure Data Lake (e.g., folder paths in datasets).
  - References to MAP 2.0 views (e.g., "MAP2.0", "customer_view", "unifiedCustomerId").
- **AI Guidance**: Use `code_execution` to prototype a script like:
  ```python
  import json
  import glob
  import re
  from collections import defaultdict

  MAP_PATTERNS = [
      r'MAP2\.0', r'customer_view', r'unifiedCustomerId',
      r'customer_role|user|user_account|user_customer_role',  # From prior context
      r'fnb_loyalty|sales_skill|district|sinc'  # F&B-specific
  ]

  def analyze_pipeline(repo_path='./adf_publish', pipeline_name='D365-PZMIGRATION-D'):
      findings = defaultdict(list)
      pipeline_details = {'activities': [], 'sources': [], 'mappings': [], 'staging': []}
      
      for file_path in glob.glob(f"{repo_path}/**/*.json", recursive=True):
          with open(file_path, 'r') as f:
              try:
                  data = json.load(f)
                  content = json.dumps(data)
                  if pipeline_name not in file_path and pipeline_name not in content:
                      continue
                  
                  # Check for MAP patterns
                  for pattern in MAP_PATTERNS:
                      matches = re.findall(pattern, content, re.IGNORECASE)
                      if matches:
                          findings[file_path].extend(matches)
                  
                  # Extract pipeline details
                  if 'pipeline' in file_path.lower():
                      activities = data.get('properties', {}).get('activities', [])
                      pipeline_details['activities'].extend([act.get('type') for act in activities])
                  if 'dataset' in file_path.lower():
                      source = data.get('properties', {}).get('typeProperties', {}).get('table', '')
                      folder = data.get('properties', {}).get('typeProperties', {}).get('folderPath', '')
                      pipeline_details['sources'].append(source)
                      pipeline_details['staging'].append(folder)
                  if 'dataflow' in file_path.lower():
                      transformations = data.get('properties', {}).get('typeProperties', {}).get('sources', [])
                      pipeline_details['mappings'].extend([t.get('name') for t in transformations])
              
              except json.JSONDecodeError:
                  print(f"Invalid JSON: {file_path}")
      
      print("\n=== Pipeline Analysis ===")
      print(f"Pipeline: {pipeline_name}")
      print(f"Activities: {pipeline_details['activities']}")
      print(f"Sources: {pipeline_details['sources']}")
      print(f"Mappings: {pipeline_details['mappings']}")
      print(f"Staging: {pipeline_details['staging']}")
      print("\nMAP 2.0 Impacts:", dict(findings))
      return findings, pipeline_details

  analyze_pipeline()
  