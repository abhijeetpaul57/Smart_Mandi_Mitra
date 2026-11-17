# MandiMitra (मंडी मित्र) — Smart Vegetable Market Discovery System
*A 24-Hour Real-World Problem Solving Project in C++17*

[![C++17 Standard](https://img.shields.io/badge/Language-C%2B%2B17-blue.svg)](https://isocpp.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Fieldwork: Verified](https://img.shields.io/badge/Fieldwork-Local%20Mandi-success.svg)](fieldwork.md)

---

## 1. Project Introduction
**MandiMitra** is a lightweight, practical console discovery system and information directory engineered for traditional Indian open-air vegetable markets (*mandis*). It empowers shoppers to discover small, less-visible vendors situated deep inside crowded market lanes, compare vegetable prices and freshness grades transparently, and consult a printable entrance board directory before making purchases.

---

## 2. Real-World Problem & Fieldwork Context

### The Problem Hypothesis
In local, open-air vegetable markets, vendors are distributed along a linear or labyrinthine path:
- **Entrance Zone**: Stalls immediately adjacent to the main access gate.
- **Middle Lane**: Central passage with moderate pedestrian flow.
- **Inner Lane**: Stalls located 40+ meters deep in narrow alleys or rear corners.

Casual shoppers, fatigued by carrying heavy loads or pressed for time, predominantly purchase their daily produce at the first few stalls they see near the entrance. Consequently:
1. **Inner-Lane Vendors Suffer Footfall Deprivation**: Stalls deeper inside receive a fraction of customer visits despite procuring identical wholesale produce.
2. **Shoppers Miss Out on Freshness & Fair Deals**: Inner vendors often carry freshly brought produce or competitive prices, but lack any discovery channel to signal their stock to approaching shoppers.
3. **Information Asymmetry**: There is no board, directory, or notice system at the entrance to inform customers what is available deeper inside.

> *Scientific Restraint*: This hypothesis is treated as an observational investigation and verified through direct physical fieldwork rather than assumed as an a priori fact.

---

## 3. The Proposed Solution
MandiMitra bridges this information gap without relying on expensive hardware, paid cloud APIs, or complex mobile apps that street vendors cannot operate:
1. **Market Directory & Entrance Board (`market_board.txt`)**: A clean, printable/displayable bulletin generated directly from verified market data to guide shoppers at the entrance gate.
2. **Transparent Discovery Algorithm**: When shoppers search for a vegetable (e.g. Tomato or Spinach), MandiMitra ranks offerings giving additional discovery priority to Inner-Lane stalls, while displaying all actual quoted prices and freshness grades so shoppers can make informed choices.
3. **Price & Freshness Comparison**: Allows side-by-side comparison across vendors, sorted by price (low to high), freshness (Fresh to Low), or overall discovery score.
4. **Customer Observation Analytics**: Measures footfall distribution across zones using actual timestamped observation windows to verify whether spatial disadvantage is present.

---

## 4. Key Features

| Feature ID | Module | Description |
| :--- | :--- | :--- |
| **Feature A** | **Vendor Management** | Register vendors with ID, name/alias, shop number, and zone (`Entrance`, `Middle Lane`, `Inner Lane`). Update info dynamically. |
| **Feature B** | **Vegetable Inventory** | Record vegetable stock, prices per kg, available quantities, and manual freshness grades. |
| **Feature C** | **Smart Vendor Discovery** | Search produce by name; automatically highlights and prioritizes inner-lane vendors without hiding entrance stalls. |
| **Feature D** | **Freshness Level Tracking** | Three clear human-graded tiers: `Fresh`, `Moderate`, and `Low` based on physical inspection (no fake AI/vision claims). |
| **Feature E** | **Price Comparison** | Compare prices, stock, and freshness across vendors; sort by price, freshness, or discovery score. |
| **Feature F** | **Entrance Information Board** | Generates `market_board.txt` for physical printing or digital display at the mandi entrance. |
| **Feature G** | **Customer Observation Analysis** | Analyzes fieldwork observations across 5 key dimensions:<br>1. Average buyers per observation by zone.<br>2. Entrance vs. inner-lane traffic disparity & drop-off rate.<br>3. Average vegetable prices & customer savings by zone.<br>4. Vendor visibility index & footfall deficit relative to market mean.<br>5. Targeted spotlight candidates for the Entrance Notice Board. |
| **Feature H** | **Dataset Validator & Selector** | Menu option 12 validates CSV files for structural integrity, and enables safe switching between Real Fieldwork (`data.csv`) and Synthetic Demo (`demo_data.csv`) for testing. |

---

## 5. Technology Stack
- **Primary Language**: C++17 (compiled using MinGW GCC 6.3.0+ / Clang / MSVC)
- **Data Persistence**: CSV file handling (`data/data.csv`) with automatic header generation and quoted field escaping.
- **Data Structures**:
  - `std::vector<ObservationRecord>`: Contiguous, cache-friendly storage for all inventory observations.
  - `std::unordered_map<std::string, Vendor>`: $O(1)$ average-time lookup for vendor metadata by `vendor_id`.
  - `std::map<std::string, VendorSession>`: Keyed deduplication for observation windows to prevent inflating customer counts.
- **Algorithms**:
  - Multi-criteria ranking and sorting (`std::sort` with custom lambdas).
  - Case-insensitive substring matching for flexible produce search.
  - Linear statistical aggregation for footfall normalization.
- **Zero External Dependencies**: Pure C++ standard library (`<iostream>`, `<vector>`, `<string>`, `<algorithm>`, `<unordered_map>`, `<map>`, `<fstream>`). No paid APIs, no Python wrappers, no web scraping, and no synthetic datasets.

---

## 6. Intelligent Recommendation & Discovery Logic

### Mathematical Formula
To overcome the physical invisibility of inner-lane vendors, MandiMitra computes a transparent **Discovery Score** $S \in [0, 100]$ for each vendor offering a searched vegetable:

$$S = S_{\text{zone}} + S_{\text{freshness}} + S_{\text{price}} + S_{\text{stock}}$$

Where:
1. **Zone Visibility Bonus ($S_{\text{zone}} \in \{10, 20, 35\}$)**:
   - `Inner Lane`: **35 points** (maximum boost to compensate for low natural footfall)
   - `Middle Lane`: **20 points**
   - `Entrance`: **10 points**
2. **Freshness Score ($S_{\text{freshness}} \in \{5, 20, 35\}$)**:
   - `Fresh`: **35 points**
   - `Moderate`: **20 points**
   - `Low`: **5 points**
3. **Price Competitiveness Score ($S_{\text{price}} \in [0, 20]$)**:
   - Let $P_{\min}$ be the lowest quoted price for this vegetable across the market, and $P$ be this vendor's price:
   $$S_{\text{price}} = 20 \times \min\left(1.0, \frac{P_{\min}}{P}\right)$$
4. **Stock Availability Score ($S_{\text{stock}} \in [0, 10]$)**:
   $$S_{\text{stock}} = \min(10.0, Q \times 0.5)$$
   *(where $Q$ is available quantity in kg)*

### Ethical Safeguards
- **No Hidden Vendors**: Every vendor selling the requested vegetable is displayed; inner vendors are simply highlighted at the top.
- **Complete Price Transparency**: Actual prices and freshness levels are always displayed in plain view so shoppers retain full autonomy.

---

## 7. Project Folder Structure

```
smart_mandimitra/
├── .gitignore                   # Build artifacts, binaries, and temp files ignored
├── build.bat                    # One-click Windows build script
├── run.bat                      # One-click run script
├── GIT_GUIDE.md                 # Step-by-step Git workflow (5+ commits, research first)
├── README.md                    # Complete project documentation
├── research.md                  # Step 1: Problem statement, real person profile, sources
├── fieldwork.md                 # Step 2: Timestamped photos, interview, observation notes
├── reflection.md                # Step 4: Human reflection template (no AI)
├── market_board.txt             # Generated entrance information directory
├── data/
│   ├── data.csv                 # Primary Real fieldwork dataset (starts with header only)
│   ├── collection_template.csv  # 20 blank templated rows for fieldwork data entry
│   ├── demo_data.csv            # Synthetic test dataset (20 sample rows for software testing only)
│   └── README.md                # Dataset column specifications and rules
├── photos/
│   ├── market_lane_overview.jpeg    # Photo 1: Overview of market lane layout
│   ├── vendor_vegetable_stall.jpeg  # Photo 2: Inner-lane vegetable stall
│   ├── vendor_garlic_stall.jpeg     # Photo 3: Ground vendor stall
│   ├── student_fieldwork_selfie.jpeg# Photo 4: Student on-site verification selfie
│   └── README.md                    # Photo evidence index and camera details
├── ai-chats/
│   └── README.md                # Transcript log instructions for AI transparency
├── docs/
│   ├── DATA_COLLECTION_GUIDE.md # Fieldwork logging guide (avoiding duplicate counts)
│   ├── EVALUATION_PREP.md       # 10-minute viva cheat sheet & live code modification guide
│   └── README.md                # Docs index
├── include/
│   ├── Models.hpp               # Vendor, ObservationRecord, and ScoredOffering structs
│   ├── Utils.hpp                # String trimming, safe input parsers, datetime helpers
│   ├── CSVHandler.hpp           # CSV parser, writer, and diagnostics validator
│   └── MandiSystem.hpp          # Core application logic and feature coordinators
└── src/
    ├── main.cpp                 # 13-option interactive console menu
    ├── Utils.cpp                # Input validation, CSV escaping, and console layout
    ├── CSVHandler.cpp           # File stream handler and field validator
    └── MandiSystem.cpp          # Feature implementation, scoring, and analysis engine
```

---

## 8. Compilation & Execution Instructions

### Prerequisites
- Any C++17 compliant compiler: `g++` (MinGW / GCC), `clang++`, or Visual Studio `cl.exe`.
- Operating System: Windows, Linux, or macOS.

### Compilation Command
From the project root directory:

```bash
g++ -std=c++17 src/main.cpp src/CSVHandler.cpp src/MandiSystem.cpp src/Utils.cpp -Iinclude -o mandimitra.exe
```

Or on Windows:
```cmd
build.bat
```

### Execution Command
```bash
./mandimitra.exe
```
Or on Windows:
```cmd
run.bat
```

---

## 9. CSV Dataset Format & Fieldwork Guidelines

The primary dataset file is `data/data.csv`.

### CSV Columns
```csv
record_id,date,start_time,duration_minutes,vendor_id,vendor_name,shop_number,zone,vegetable,price_per_kg,available_quantity_kg,freshness_level,buyers_counted
```

### Integrity Rules
1. **No Synthetic / Random Data**: Every entry must be collected in person at the local market.
2. **Session Deduplication**: To record multiple vegetables sold by one vendor during a 20-minute window, record `buyers_counted` on the first row and set subsequent rows to `0`, or allow MandiMitra's session deduplicator to process them automatically.
3. **Freshness Assessment**: Must be based on visual physical inspection (`Fresh`, `Moderate`, `Low`).
4. **Validation**: Run Menu Option 12 (`Validate Dataset`) after adding records to verify 0 errors.

---

## 10. Actual Program Output Section
*(To be completed after running the tool with your 20 collected fieldwork records)*

### Sample Menu Display
```text
==============================================================================
         MANDIMITRA: SMART VEGETABLE MARKET DISCOVERY SYSTEM         
           A 24-Hour Real-World Problem Solving Project (C++17)      
==============================================================================
 Active Dataset: data/data.csv | Records: 20 | Vendors: 5
------------------------------------------------------------------------------
  --- VENDOR & INVENTORY MANAGEMENT ---
   1. Register / Update Vendor
   2. Add Vegetable to Inventory
   3. Update Vegetable Stock (kg)
   4. Update Freshness Level (Fresh / Moderate / Low)

  --- SMART DISCOVERY & CUSTOMER TOOLS ---
   5. Search for Vegetables (with Inner-Lane Boost)
   6. Compare Vegetable Prices & Freshness
   7. Discover Inner-Lane Vendors (Featured Directory)
   8. View Complete Market Directory (Zone-by-Zone)
   9. Generate Entrance Information Board (market_board.txt)

  --- FIELDWORK ANALYSIS & SYSTEM UTILITIES ---
  10. Analyse Customer Observations (Entrance vs Inner Footfall)
  11. View All Registered Vendors
  12. Validate Dataset (Diagnose CSV for Integrity)
  13. Exit
==============================================================================
```

### Video Demonstration Link
- **3-Minute Screen Recording**: `[Insert YouTube / Loom / Drive link to your 3-minute video showing the application running]`

---

## 11. Limitations & What MandiMitra Should NOT Be Trusted For

1. **Not an Automated IoT Inventory System**: MandiMitra relies on vendor-reported or observer-recorded stock quantities. It does not interface with digital weighing scales.
2. **Not Computer Vision Freshness Detection**: Freshness is manually classified by physical human inspection. The tool does not use image processing or AI classification to judge spoilage.
3. **Not a Long-Term Causal Sales Predictor**: Footfall comparison demonstrates observational correlation across sampling intervals. It does not statistically prove long-term revenue gains without multi-week randomized trials.
4. **Not Dynamic Street GPS Navigation**: MandiMitra relies on clear static zones (`Entrance`, `Middle Lane`, `Inner Lane`) and stall numbers; it does not map real-time crowd blockages or moving hand-carts.
