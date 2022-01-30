
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