#!/bin/bash

# Initialize Analysis Workspace
# Sets up a new Azure service analysis workspace with the Azure Service Analysis Framework

set -e

# Default values
SERVICE="adf"
FORCE=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Help function
show_help() {
    cat << EOF
Initialize Azure Service Analysis Workspace

USAGE:
    $0 [OPTIONS] FRAMEWORK_PATH WORKSPACE_PATH

ARGUMENTS:
    FRAMEWORK_PATH    Path to the Azure Service Analysis Framework repository
    WORKSPACE_PATH    Path to the analysis workspace to initialize

OPTIONS:
    -s, --service SERVICE    Azure service to analyze (adf, aks, synapse) [default: adf]
    -f, --force              Overwrite existing files without prompting
    -h, --help               Show this help message

EXAMPLES:
    # Initialize ADF analysis workspace
    $0 /path/to/framework /path/to/analysis

    # Initialize AKS workspace with force overwrite
    $0 -s aks -f /path/to/framework /path/to/analysis

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--service)
            SERVICE="$2"
            shift 2
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -*)
            echo -e "${RED}Unknown option: $1${NC}" >&2
            show_help >&2
            exit 1
            ;;
        *)
            if [[ -z "$FRAMEWORK_PATH" ]]; then
                FRAMEWORK_PATH="$1"
            elif [[ -z "$WORKSPACE_PATH" ]]; then
                WORKSPACE_PATH="$1"
            else
                echo -e "${RED}Too many arguments${NC}" >&2
                show_help >&2
                exit 1
            fi
            shift
            ;;
    esac
done

# Validate required arguments
if [[ -z "$FRAMEWORK_PATH" || -z "$WORKSPACE_PATH" ]]; then
    echo -e "${RED}Missing required arguments${NC}" >&2
    show_help >&2
    exit 1
fi

# Validate framework path
if [[ ! -d "$FRAMEWORK_PATH" ]]; then
    echo -e "${RED}Framework path does not exist: $FRAMEWORK_PATH${NC}" >&2
    exit 1
fi

# Create workspace directory if it doesn't exist
if [[ ! -d "$WORKSPACE_PATH" ]]; then
    echo "Creating workspace directory: $WORKSPACE_PATH"
    mkdir -p "$WORKSPACE_PATH"
fi

# Function to copy with confirmation
copy_with_confirmation() {
    local source="$1"
    local dest="$2"
    local description="$3"

    if [[ -e "$dest" && "$FORCE" != true ]]; then
        echo -n "Overwrite existing $description? (y/N): "
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            echo "Skipping $description"
            return
        fi
    fi

    echo "Copying $description..."
    cp -r "$source" "$dest"
}

# Initialize workspace
echo "Initializing Azure Service Analysis Framework workspace..."
echo "Framework: $FRAMEWORK_PATH"
echo "Workspace: $WORKSPACE_PATH"
echo "Service: $SERVICE"
echo

# Create .github directory
GITHUB_PATH="$WORKSPACE_PATH/.github"
mkdir -p "$GITHUB_PATH"

# Copy AI assistant instructions
INSTRUCTIONS_SOURCE="$FRAMEWORK_PATH/.github/copilot-instructions.md"
INSTRUCTIONS_DEST="$GITHUB_PATH/copilot-instructions.md"
if [[ -f "$INSTRUCTIONS_SOURCE" ]]; then
    copy_with_confirmation "$INSTRUCTIONS_SOURCE" "$INSTRUCTIONS_DEST" "AI assistant instructions"
else
    echo -e "${YELLOW}Warning: AI assistant instructions not found${NC}"
fi

# Copy standards
STANDARDS_SOURCE="$FRAMEWORK_PATH/standards"
STANDARDS_DEST="$GITHUB_PATH/standards"
if [[ -d "$STANDARDS_SOURCE" ]]; then
    copy_with_confirmation "$STANDARDS_SOURCE" "$STANDARDS_DEST" "analysis standards"
fi

# Copy service-specific standards
SERVICE_STANDARDS_SOURCE="$FRAMEWORK_PATH/standards/$SERVICE"
if [[ -d "$SERVICE_STANDARDS_SOURCE" ]]; then
    copy_with_confirmation "$SERVICE_STANDARDS_SOURCE" "$STANDARDS_DEST" "service-specific standards"
fi

# Copy templates
TEMPLATES_SOURCE="$FRAMEWORK_PATH/templates"
TEMPLATES_DEST="$WORKSPACE_PATH/templates"
if [[ -d "$TEMPLATES_SOURCE" ]]; then
    copy_with_confirmation "$TEMPLATES_SOURCE" "$TEMPLATES_DEST" "ADR templates"
fi

# Copy examples
EXAMPLES_SOURCE="$FRAMEWORK_PATH/examples/$SERVICE"
EXAMPLES_DEST="$WORKSPACE_PATH/examples"
if [[ -d "$EXAMPLES_SOURCE" ]]; then
    copy_with_confirmation "$EXAMPLES_SOURCE" "$EXAMPLES_DEST" "service examples"
fi

# Create Analysis directory
ANALYSIS_PATH="$WORKSPACE_PATH/Analysis"
mkdir -p "$ANALYSIS_PATH"
echo "Created Analysis directory"

# Create README for workspace
README_PATH="$WORKSPACE_PATH/README.md"
if [[ ! -f "$README_PATH" || "$FORCE" == true ]]; then
    cat > "$README_PATH" << EOF
# Azure Service Analysis Workspace

This workspace is configured for analyzing Azure $SERVICE services using the Azure Service Analysis Framework.

## Setup
- AI assistant instructions: .github/copilot-instructions.md
- Analysis standards: .github/standards/
- ADR templates: templates/
- Reference examples: examples/

## Getting Started
1. Open this workspace in VS Code with AI assistant enabled
2. Use prompts like: "Analyze the current state of [service/component] and identify architectural patterns"
3. Generate ADRs with: "Generate a [technical/business/architectural/implementation] ADR for [component]"

## Analysis Directory
Place all generated ADRs and analysis documents in the Analysis/ directory.

## Resources
- Framework Repository: $FRAMEWORK_PATH
- Documentation: $FRAMEWORK_PATH/docs/

EOF
    echo "Created workspace README.md"
fi

echo
echo -e "${GREEN}Workspace initialization complete!${NC}"
echo
echo "Next steps:"
echo "1. Open $WORKSPACE_PATH in VS Code"
echo "2. Ensure AI assistant can access .github/copilot-instructions.md"
echo "3. Start analysis with: 'Analyze the current state of your $SERVICE service'"
echo
echo "For help, see: $FRAMEWORK_PATH/docs/getting-started.md"