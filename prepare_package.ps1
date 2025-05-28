# Create AI Business System Package
$packageName = "AI_Business_System_Premium"
$packageDir = ".\$packageName"

# Create main directory
New-Item -ItemType Directory -Force -Path $packageDir

# Create subdirectories
$directories = @(
    "01_Business_Model_Canvas",
    "02_Implementation_Guides",
    "03_AI_Tools_Stack",
    "04_Client_Acquisition",
    "05_Service_Delivery",
    "06_Revenue_Optimization",
    "07_Templates",
    "08_Video_Tutorials",
    "09_Community_Resources"
)

foreach ($dir in $directories) {
    New-Item -ItemType Directory -Force -Path "$packageDir\$dir"
}

# Copy main README
Copy-Item "README.md" -Destination "$packageDir\README.md"

# Copy section content
Copy-Item "01_Business_Model_Canvas\*" -Destination "$packageDir\01_Business_Model_Canvas" -Recurse
Copy-Item "02_Implementation_Guides\*" -Destination "$packageDir\02_Implementation_Guides" -Recurse
Copy-Item "03_AI_Tools_Stack\*" -Destination "$packageDir\03_AI_Tools_Stack" -Recurse
Copy-Item "04_Client_Acquisition\*" -Destination "$packageDir\04_Client_Acquisition" -Recurse
Copy-Item "05_Service_Delivery\*" -Destination "$packageDir\05_Service_Delivery" -Recurse
Copy-Item "06_Revenue_Optimization\*" -Destination "$packageDir\06_Revenue_Optimization" -Recurse
Copy-Item "07_Templates\*" -Destination "$packageDir\07_Templates" -Recurse
Copy-Item "08_Video_Tutorials\*" -Destination "$packageDir\08_Video_Tutorials" -Recurse
Copy-Item "09_Community_Resources\*" -Destination "$packageDir\09_Community_Resources" -Recurse

# Create ZIP file
Compress-Archive -Path $packageDir -DestinationPath "$packageName.zip" -Force

Write-Host "Package created successfully: $packageName.zip" 