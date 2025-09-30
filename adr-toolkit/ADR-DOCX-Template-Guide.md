# ADR DOCX Reference Template Creation Guide

## Overview
To create properly formatted DOCX documents for ADR generation, you need to create reference DOCX templates that define the formatting, branding, and layout for each partner/client combination.

## Required Reference DOCX Files

### Accenture Reference Template
**Path:** `Analysis/partners/accenture/templates/accenture-template.docx`

### Ecolab Reference Template  
**Path:** `Analysis/clients/ecolab/templates/ecolab-template.docx`

## Template Creation Steps

### 1. Create Base Template
1. Open Microsoft Word
2. Set page layout:
   - Page size: Letter (8.5" x 11")
   - Margins: 1" all sides
   - Orientation: Portrait

### 2. Define Styles
Create these custom styles (Format > Styles > Create New Style):

#### Heading Styles
- **Heading 1**: Arial 16pt, Bold, Accent Color (for ADR title)
- **Heading 2**: Arial 14pt, Bold (for main sections)
- **Heading 3**: Arial 12pt, Bold (for subsections)
- **Heading 4**: Arial 11pt, Bold, Italic (for sub-subsections)

#### Body Styles
- **Normal**: Arial 11pt, Line spacing 1.15
- **Body Text**: Arial 11pt
- **Caption**: Arial 10pt, Italic, Centered

#### Special Styles
- **Confidential**: Arial 10pt, Bold, Red (for confidentiality markings)
- **Metadata**: Arial 10pt, Gray (for metadata fields)
- **Code**: Courier New 10pt, Light Gray background

### 3. Add Headers/Footers
- **Header**: Company logo, document title, date
- **Footer**: Page numbers, confidentiality statement, version info

### 4. Table of Contents
- Insert TOC with Heading 1-3 styles
- Format with Arial 11pt, justified alignment

### 5. Save as Reference Template
- Save as `accenture-template.docx` or `ecolab-template.docx`
- Place in the appropriate templates directory

## Accenture-Specific Customizations

### Branding
- **Primary Color**: #A100FF (Accenture Purple)
- **Secondary Color**: #FFFFFF (White)
- **Accent Color**: #000000 (Black)

### Header Content
```
[Accenture Logo]                    ADR {NNN}: {Title}
Accenture Confidential             {Date}
```

### Footer Content
```
Page {PAGE} of {NUMPAGES}           Accenture | {Engagement Name} | {Date}
Accenture Confidential - For Internal Use Only
```

### Required Sections Formatting
- Executive Summary: Highlighted box with purple border
- Business Case: Financial tables with currency formatting
- Technical Architecture: Diagrams with proper spacing

## Ecolab-Specific Customizations

### Branding
- **Primary Color**: #0066CC (Ecolab Blue)
- **Secondary Color**: #FFFFFF (White)
- **Safety Color**: #FF0000 (Red for safety warnings)

### Header Content
```
[Ecolab Logo]                      ADR {NNN}: {Title}
Ecolab Confidential                {Date}
```

### Footer Content
```
Page {PAGE} of {NUMPAGES}           Ecolab | {Business Unit} | {Region}
Ecolab Confidential - Regulatory Compliance Required
```

### Compliance Section Formatting
- **Regulatory Compliance**: Red-bordered warning boxes
- **Safety Standards**: Highlighted safety alerts
- **Environmental Impact**: Green-themed environmental notes
- **Chemical Handling**: Special hazard warning formatting

## Usage in Generation Script

The script automatically detects and uses these reference templates:

```powershell
# Priority order for reference documents:
1. Client reference DOCX (ecolab-template.docx)
2. Partner reference DOCX (accenture-template.docx)
3. Default pandoc formatting (no reference)
```

## Testing

After creating the reference templates:

1. Run the generation script:
```powershell
.\Analysis\Generate-Partner-ADR.ps1 -Partner "Accenture" -Client "Ecolab" -Title "Test Document" -GenerateAllFormats
```

2. Verify the output DOCX has:
   - Proper branding and colors
   - Correct headers/footers
   - Formatted table of contents
   - Appropriate styles applied

## Template Maintenance

- Update reference templates when branding changes
- Test with sample ADRs after modifications
- Keep backup versions of working templates