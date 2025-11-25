.PHONY: all private public clean

# Default: build private version with full contact info
all: private

# Build private resume with full contact info (not for git)
private:
	@echo "Building private resume with full contact info..."
	@if [ ! -f contact-info.tex ]; then \
		echo "Error: contact-info.tex not found. Copy from contact-info.tex.template"; \
		exit 1; \
	fi
	pdflatex resume.tex
	@echo "✓ Built resume.pdf (private version)"

# Build public resume with redacted contact info (for git commits)
public:
	@echo "Building public resume with redacted contact info..."
	@# Backup current contact-info.tex if it exists
	@if [ -f contact-info.tex ]; then \
		cp contact-info.tex contact-info.tex.backup; \
	fi
	@# Use redacted version
	cp contact-info-redacted.tex contact-info.tex
	pdflatex -jobname=resume-public resume.tex
	@# Restore original contact-info.tex
	@if [ -f contact-info.tex.backup ]; then \
		mv contact-info.tex.backup contact-info.tex; \
	fi
	@echo "✓ Built resume-public.pdf (redacted version for git)"

# Clean build artifacts
clean:
	rm -f *.aux *.log *.out *.backup
	@echo "✓ Cleaned build artifacts"

# Clean everything including PDFs
cleanall: clean
	rm -f resume.pdf resume-public.pdf
	@echo "✓ Cleaned all generated files"
