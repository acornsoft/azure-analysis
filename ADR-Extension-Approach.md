# ADR Toolkit - VS Code Extension Approach

This would be the **recommended best practice** for a distributable tool like the ADR toolkit.

## Why VS Code Extension?

- **Proper Integration**: Commands appear in Command Palette, menus, etc.
- **User Experience**: Settings UI, status bar, notifications
- **Distribution**: Easy installation via marketplace or .vsix files
- **Isolation**: Proper sandboxing and workspace trust handling
- **Updates**: Built-in update mechanism
- **Documentation**: Integrated help and walkthroughs

## Extension Structure

```
adr-toolkit-extension/
├── package.json           # Extension manifest
├── src/
│   ├── extension.ts       # Main activation
│   ├── commands.ts        # Command handlers
│   ├── converter.ts       # DOCX conversion logic
│   └── generator.ts       # ADR generation logic
├── resources/
│   ├── templates/         # Document templates
│   └── icons/            # Extension icons
└── test/                 # Unit tests
```

## package.json Example

```json
{
  "name": "adr-toolkit",
  "displayName": "ADR Toolkit",
  "description": "Generate professional Accenture-branded ADRs",
  "version": "1.0.0",
  "engines": {
    "vscode": "^1.74.0"
  },
  "categories": ["Other"],
  "activationEvents": [
    "onCommand:adr-toolkit.convertToDocx",
    "onCommand:adr-toolkit.generateAdr"
  ],
  "main": "./out/extension.js",
  "contributes": {
    "commands": [
      {
        "command": "adr-toolkit.convertToDocx",
        "title": "Convert to Accenture DOCX"
      },
      {
        "command": "adr-toolkit.generateAdr",
        "title": "Generate ADR"
      }
    ],
    "menus": {
      "commandPalette": [
        {
          "command": "adr-toolkit.convertToDocx",
          "when": "resourceExtname == .md"
        }
      ]
    },
    "configuration": {
      "title": "ADR Toolkit",
      "properties": {
        "adrToolkit.partner": {
          "type": "string",
          "default": "Accenture",
          "description": "Partner name for branding"
        }
      }
    }
  }
}
```

## Benefits Over Current Approach

1. **Installation**: `code --install-extension adr-toolkit.vsix`
2. **Settings UI**: Visual configuration instead of JSON files
3. **Context Menus**: Right-click on files for actions
4. **Status Bar**: Show conversion progress
5. **Marketplace**: Share with team via private marketplace
6. **Version Management**: Proper semantic versioning and updates

## Development Steps

1. Install VS Code Extension Development tools
2. Create extension project with `yo code`
3. Implement commands in TypeScript
4. Package with `vsce package`
5. Install locally for testing

Would you like me to create a proper VS Code extension for the ADR toolkit instead?