# Creating DOCX Reference Templates for ADR Generation

## Overview
To generate properly formatted Word documents with specific branding and layout, you need to create reference DOCX templates. These templates define the formatting, styles, headers, footers, and branding that will be applied to generated ADR documents.

## Current Status
✅ **Placeholder files created:**
- `Analysis/partners/accenture/templates/accenture-template.docx`
- `Analysis/clients/ecolab/templates/ecolab-template.docx`

⚠️ **Action Required:** Replace these empty placeholder files with properly formatted DOCX templates.

## Step-by-Step Template Creation

### Step 1: Open Microsoft Word
1. Create a new blank document
2. Set page layout:
   - **Size:** Letter (8.5" × 11")
   - **Margins:** 1" on all sides
   - **Orientation:** Portrait

### Step 2: Define Document Styles
Create these custom styles (Home > Styles > Create a Style):

#### Heading Styles
- **Heading 1:** Arial 16pt, Bold, Purple (#A100FF for Accenture, Blue #0066CC for Ecolab)
- **Heading 2:** Arial 14pt, Bold, Black
- **Heading 3:** Arial 12pt, Bold, Black
- **Heading 4:** Arial 11pt, Bold, Italic, Black

#### Body Text Styles
- **Normal:** Arial 11pt, Line spacing: 1.15, Justified alignment
- **Body Text:** Arial 11pt, Line spacing: 1.15
- **Caption:** Arial 10pt, Italic, Centered, Gray

#### Special Styles
- **Confidential:** Arial 10pt, Bold, Red (#FF0000)
- **Metadata:** Arial 10pt, Gray (#666666)
- **Code Block:** Courier New 10pt, Light Gray background (#F5F5F5)
- **Warning Box:** Arial 10pt, Red border, Light red background

### Step 3: Add Headers and Footers

#### Header Setup
1. Insert > Header > Blank
2. Create a table with 3 columns:
   - Left: Company logo (see branding section below)
   - Center: Document title placeholder
   - Right: Date placeholder

#### Footer Setup
1. Insert > Footer > Blank
2. Add page numbering: Insert > Page Number > Bottom of Page > Plain Number 3
3. Add confidentiality statement below page number

### Step 4: Add Table of Contents
1. Insert > Table of Contents > Custom Table of Contents
2. Set Show levels: 3
3. Format: Arial 11pt, Justified

### Step 5: Add Sample Content
Add one sample of each element that will be in ADRs:
- A level 1 heading
- A level 2 heading with body text
- A bulleted list
- A numbered list
- A table (2-3 columns)
- A code block (using the Code Block style)
- A warning box (using the Warning Box style)

### Step 6: Apply Branding

#### Accenture Branding
- **Primary Color:** #A100FF (Accenture Purple)
- **Logo:** Download from Accenture brand guidelines
- **Header Text:** "Accenture Confidential"
- **Footer Text:** "Accenture | [Engagement Name] | [Date] | Page X of Y"

#### Ecolab Branding
- **Primary Color:** #0066CC (Ecolab Blue)
- **Logo:** Download from Ecolab brand guidelines
- **Header Text:** "Ecolab Confidential"
- **Footer Text:** "Ecolab | [Business Unit] | [Region] | Page X of Y"
- **Safety Color:** #FF0000 (Red) for compliance warnings

### Step 7: Save the Template
1. File > Save As
2. Save as type: Word Document (*.docx)
3. Replace the placeholder file in the appropriate directory:
   - Accenture: `Analysis/partners/accenture/templates/accenture-template.docx`
   - Ecolab: `Analysis/clients/ecolab/templates/ecolab-template.docx`

## Testing Your Templates

### Test Generation
```powershell
.\Analysis\Generate-Partner-ADR.ps1 -Partner "Accenture" -Client "Ecolab" -Title "Test Document" -GenerateAllFormats
```

### Verify Output
Check that the generated DOCX has:
- ✅ Correct company branding and colors
- ✅ Proper headers and footers
- ✅ Formatted table of contents
- ✅ Consistent heading styles
- ✅ Professional layout and spacing

## Troubleshooting

### Common Issues
1. **Styles not applied:** Ensure all required styles are defined in the reference template
2. **Headers/footers missing:** Check that headers and footers are properly set up
3. **Branding incorrect:** Verify logo placement and color schemes
4. **Table of contents malformed:** Ensure heading styles are correctly applied

### Template Validation
Run the generation script and check the console output for reference template usage messages.

## Advanced Customization

### Custom Pandoc Variables
The script uses these pandoc variables for DOCX generation:
- `fontsize=11pt`
- `fontfamily=arial`
- `geometry:margin=1in`
- `highlight-style=tango`

### Adding Custom Styles
For additional formatting needs, add custom styles to the reference template and ensure they're used in the Markdown content.

## Maintenance
- Update templates when company branding changes
- Test with sample ADRs after modifications
- Keep backup versions of working templates
- Document any custom styles or formatting requirements