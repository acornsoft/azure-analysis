# ADR Template Management

This document describes the workflow for managing ADR template files in the azure-analysis repository.

## Git Configuration

- **Only template files in `src/adr-toolkit/` are committed to git**
- **All other `*.docx` files are ignored** (including those in `.adr-toolkit/` deployment folders)
- Template files are only committed when you explicitly choose to update them

## Workflow

### 1. Update Templates (Local Development)
- Edit template files in `src/adr-toolkit/partners/*/templates/` or `src/adr-toolkit/clients/*/templates/`
- Test changes locally
- **Templates are NOT automatically committed** - you control when to commit

### 2. Commit Template Updates (When Ready)
```bash
# Add specific template files you want to update
git add src/adr-toolkit/partners/accenture/templates/accenture-template.docx

# Or add all template files
git add src/adr-toolkit/**/templates/*-template.docx

# Commit with descriptive message
git commit -m "Update ADR templates: [description of changes]"
```

### 3. Sync Templates to Deployment Locations
After committing template updates, sync them to deployment folders:

```powershell
# From azure-analysis directory
.\Sync-ADR-Templates.ps1
```

This will copy updated templates to:
- `.adr-toolkit/` (local deployment)
- `../../.adr-toolkit/` (workspace-level deployment)

### 4. Deploy to Other Workspaces
For other VS Code workspaces that use the ADR toolkit:

```powershell
# Run the Deploy-ADR-Toolkit.ps1 script
# This creates .adr-toolkit folders in target workspaces
```

## Key Points

- **Selective commits**: Only commit templates when you want to push updates
- **Deployment sync**: Use `Sync-ADR-Templates.ps1` to update deployment locations
- **No automatic commits**: Git won't commit template changes unless you explicitly add them
- **Clean separation**: Source templates in `src/adr-toolkit/`, deployment copies in `.adr-toolkit/`

## Scripts

- `Sync-ADR-Templates.ps1`: Syncs templates from source to deployment locations
- `Deploy-ADR-Toolkit.ps1`: Deploys toolkit to new workspaces