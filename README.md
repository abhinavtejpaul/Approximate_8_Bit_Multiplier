# Approximate 8-Bit Multiplier

## Overview
This repository contains a family of exact and approximate 8-bit multiplier designs implemented in Verilog, along with a Python-based image-processing evaluation pipeline and a Vivado Tcl script for project recreation. The designs are used to study how multiplier approximation affects both hardware behavior and downstream image-quality results in Gaussian smoothing and Sobel edge detection.

## Project Objectives
- Develop and compare exact and approximate 8-bit multiplier architectures.
- Explore how different approximation styles affect accuracy and visual quality.
- Use the multipliers inside image-processing pipelines to test practical impact.
- Measure the trade-off between hardware simplification and output degradation.
- Provide a reproducible Vivado project setup for simulation and analysis.

## Repository Contents
- `Designs/` Verilog source files for exact, approximate, and hybrid multiplier architectures.
- `Testbenches/`  Simulation testbenches for validating multiplier behavior.
- `images/`  Sample input images used by the analysis pipeline.
- `results/`  Output images and comparison results produced by the Python pipeline.
- `approx_filter_pipeline.py`  Python workflow that runs the multipliers in Gaussian and Sobel filters and computes quality metrics.
- `recreate_project.tcl`  Vivado Tcl script to recreate the FPGA project environment.

## Design Families and Techniques

### 1. Exact reference design
`Exact_Multiplier_8x8.v` serves as the baseline implementation. It is built from 8x4 multiplier blocks and adder stages, and it is used as the exact reference against which approximate designs are compared.

### 2. Recursive PBO-based approximate designs
The repository includes recursive approximation families such as:
- `PBO_3_8X8`
- `PBO_5_8X8`
- `PBO_7_8X8`

These designs represent different approximation levels, ranging from lower approximation to higher approximation, allowing a structured comparison of accuracy versus simplicity.

### 3. Mixed approximate block designs
The `PBOM8_*` family combines approximate lower and upper 8x4 blocks in different ways. Example patterns used in the repository include:
- `PBOM8_105N`  combines `PBO10_8X4` and `PBO5_8X4`
- `PBOM8_73N`  combines `PBO7_8X4` and `PBO3_8X4`

These designs are useful for studying how mixing approximation strengths across partial products changes the final output quality.

### 4. Bit-wise approximate designs
Files such as `PBOM8_8bits` and `PBOM8_11bits` indicate bit-wise approximation strategies, where a defined number of product columns are approximated directly.

### 5. Hybrid compressor-based design
`Hybrid_Multiplier_8x8.v` is a hybrid design that uses compressor blocks together with half adders and full adders. This is a more structured approximate architecture and is suited to comparing compressor-based reduction against PBO-style approximation.

## Technologies Used
- **Verilog HDL**  hardware description of multiplier architectures.
- **Python**  image-processing evaluation pipeline and reporting.
- **Tcl**  Vivado automation and project recreation.
- **Vivado**  synthesis, simulation, and project execution environment.
- **NumPy, Pillow, tifffile, scikit-image, matplotlib**  Python-side image loading, processing, metrics, and plotting.

## Image-Processing Workflow
The Python pipeline applies the selected multiplier designs to two classic image-processing operators:

### Gaussian smoothing
A 3x3 Gaussian kernel is used for smoothing. The pipeline computes an exact Gaussian reference image and then evaluates approximate outputs against it.

### Sobel edge detection
A 3x3 Sobel operator is used to compute edge magnitude. The pipeline also generates an exact Sobel reference image for comparison.

For both filters, the workflow:
1. Loads the input image.
2. Computes exact reference outputs.
3. Runs selected multiplier designs inside the filter computation.
4. Saves the output images.
5. Compares approximate results to the exact reference.

## Quality Metrics for the designs
The repository evaluates approximation quality using the following metrics:
- **Area, Power Consumption, Propagation Delay**
- **Power Delay Product (PDP)**
- **Mean Relative Error Distance (MRED)**
- **Mean Error Distance (MED)**
- **Mean Square Error (MSE)**
- **Error Rate (ER%)**

### Design-level quality metrics for ISP applications
- **PSNR (Peak Signal-to-Noise Ratio)**  computed from the mean-squared error between exact and approximate filter outputs.
- **SSIM (Structural Similarity Index Measure)**  used to measure perceptual similarity between reference and approximate images.

Higher PSNR and higher SSIM indicate that the approximate multiplier has produced output closer to the exact reference.

## Hardware / Simulation Notes
- The Python pipeline expects top-level multiplier modules to expose the ports `A[7:0]`, `B[7:0]`, and `P[15:0]`.

## How to Use
1. Open the Vivado project or recreate it using `recreate_project.tcl`.
2. Run the desired testbench from `Testbenches/` to validate the multiplier logic.
3. Execute `approx_filter_pipeline.py` to compare designs on Gaussian and Sobel image-processing tasks.
4. Review the generated images and metric tables in `results/`.

## Suggested Reporting Structure
When documenting results, it is recommended to compare:
- Exact multiplier vs approximate multipliers
- Lower approximation vs higher approximation variants
- Recursive PBO designs vs bit-wise PBOM8 designs
- PBO-based designs vs hybrid compressor-based design

## Future Work
- Implementing the design on FPGA and perform Sobel and Gaussian Filtering
- Explore applications in DNN
- Generate more efficient approximate multiplier designs

## Contribution
Contributions are welcome.

You may add your own work here by extending one or more of the following:
- new approximate multiplier architectures
- improved testbenches and verification flows
- additional image-processing benchmarks

## Publisher Notes
As of now, this project is under development. I'm building this project with my fellow peer Ankit Ghanshyam Choudhary, who belongs from the same institute as me. 

Contact Email:
- Mine : abhinavtejpaul28@gmail.com
- Ankit's : ankitgkc@gmail.com
