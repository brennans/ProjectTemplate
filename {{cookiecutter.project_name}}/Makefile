
CMAKE_BUILD_DIR = cmake-build-debug

.PHONY : all
all : benchmark scripts

.PHONY : benchmark
benchmark :
	$(CMAKE_BUILD_DIR)/benchmarks/bench_*

.PHONY : scripts
scripts :
	poetry run black .
	poetry run pytest --cov . ./tests/

.PHONY : docs
docs :
	mkdocs serve

cmake_cpp:
	cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build
	cmake --build build
