# Resume

## Privacy-Preserving Build System

This resume uses a dual-build system to keep contact information private in version control while maintaining a functional local copy.

### Files

- **`contact-info.tex`** - Your actual contact info (git-ignored, not committed)
- **`contact-info-redacted.tex`** - Public version without email/phone (committed to git)
- **`resume.pdf`** - Private version with full contact info (git-ignored)
- **`resume-public.pdf`** - Redacted version for public sharing (committed to git)

### Building

```bash
# Build private version (with your real contact info)
make private
# or just
make

# Build public version (redacted for git commits)
make public

# Clean build artifacts
make clean

# Clean everything including PDFs
make cleanall
```

### First-Time Setup

If you're cloning this repo, copy the template to create your own contact file:

```bash
cp contact-info.tex.template contact-info.tex
# Edit contact-info.tex with your actual contact information
```

### Workflow

1. Edit resume as normal
2. Build private version for yourself: `make private`
3. Build public version for git: `make public`
4. Commit only `resume-public.pdf` to version control

### VS Code Auto-Build on Save (LaTeX Workshop)

The project is configured to work with LaTeX Workshop extension:

**Setup:**
LaTeX Workshop should be installed (recommended via `.vscode/extensions.json`). If not:
```bash
code --install-extension james-yu.latex-workshop
```

**Auto-build on save:**
- Edit any `.tex` or `.cls` file and save
- `make private` runs automatically via LaTeX Workshop
- The private PDF (`resume.pdf`) updates automatically

**Manual builds:**
- Click the build icon in LaTeX Workshop sidebar, or
- `Cmd+Alt+B` - Build with LaTeX Workshop
- `Cmd+Shift+B` - Build with VS Code tasks (if you prefer)

**Build public version:**
- Open command palette (`Cmd+Shift+P`)
- Type "LaTeX Workshop: Build with recipe"
- Select "make-public"
- Or use tasks: `Cmd+Shift+P` → "Tasks: Run Task" → "build-public"
