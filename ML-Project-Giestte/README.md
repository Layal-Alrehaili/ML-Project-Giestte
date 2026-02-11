# ML-Project-Giestte (Gisette)

Machine learning experiments on the **Gisette** dataset (binary classification), implemented in a Jupyter notebook.

## Files
- `Machine Learning.ipynb` — main notebook (updated to use **relative paths** for the dataset files)
- `MachineLearningReport.pdf` — project report
- `gisette_train.data` — training features
- `gisette_train.labels` — training labels (`-1` / `1` converted to `0` / `1` inside the notebook)

## Quick start (local)
1) Create an environment and install dependencies:
```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
# source .venv/bin/activate

pip install -r requirements.txt
```

2) Launch Jupyter and open the notebook:
```bash
jupyter notebook
```

3) In the notebook, the dataset is loaded from:
- `gisette_train.data`
- `gisette_train.labels`

## Notes
- The notebook previously used Google Colab Drive paths; those have been removed so the project runs from the repo folder directly.
- The dataset file `gisette_train.data` is ~65 MB. If you prefer a lighter repo, you can remove it and download it again, then place it next to the notebook with the same filename.
## Dataset file (GitHub web upload)

If you uploaded this repository via GitHub's web UI, the training data is included as **`gisette_train.data.zip`** to stay under the upload limit.

- To extract manually on Windows (PowerShell):
  ```powershell
  Expand-Archive -Path gisette_train.data.zip -DestinationPath . -Force
  ```

The notebook also auto-extracts the file when you run it.

