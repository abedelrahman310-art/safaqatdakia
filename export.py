import zipfile
import os

def zip_project(folder_path, output_path):
    print(f"Zipping project to {output_path}...")
    exclude_dirs = {'.venv', '.git', '__pycache__', 'staticfiles'}
    exclude_files = {'mvp2026_safakat.zip', 'export.py', 'export_project.ps1', 'تصدير_المشروع.bat'}

    with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(folder_path):
            # Modify dirs in-place to skip excluded directories
            dirs[:] = [d for d in dirs if d not in exclude_dirs]
            
            for file in files:
                if file in exclude_files:
                    continue
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, folder_path)
                zipf.write(file_path, arcname)
    print("Project successfully zipped!")

if __name__ == '__main__':
    zip_project('.', 'mvp2026_safakat.zip')
