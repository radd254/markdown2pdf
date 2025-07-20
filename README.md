# markdown2pdf

- Step 0: Update system

      sudo apt update && sudo apt upgrade -y

- Step 1: Install Pandoc

      sudo apt install pandoc -y

- Step 2: Install texlive and extra package

      sudo apt install texlive-latex-extra texlive-fonts-recommended texlive-xetex -y

- Step 3: Install font support Vietnamese

      sudo apt install fonts-freefont-ttf fonts-dejavu fonts-liberation fonts-linuxlibertine -y

- Step 4: Download and Install eisvogel.latex

      wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/eisvogel.tar.gz
      
      tar -xvzf eisvogel.tar.gz
      
      sudo cp eisvogel.latex /usr/share/pandoc/data/templates/

## Write script for automatic generate PDF

- Create script.sh:

- Assign privilege

      chmod +x gen-report.sh
- Usage

      ./script.sh <file.md> <file.pdf>
