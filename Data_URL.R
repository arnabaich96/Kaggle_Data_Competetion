# Replace "your_local_file_path" with the actual path to your local file
url <- "file:///D:/OneDrive - Florida State University/MyFSU_OneDrive/R-Codes/Kaggle/training_data.csv"
destination <- "destination_folder/your_dataset.csv"  # Specify the destination folder and file name

# Download the file
download.file(url, destfile = destination, method = "curl")  # Use "curl" or "wget" as the method depending on your system

