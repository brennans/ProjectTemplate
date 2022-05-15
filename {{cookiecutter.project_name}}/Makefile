
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

update_from_template:
	git switch template
	cruft update
	git add .cruft.json
	git commit -m "Update from template"
	git switch main
	git merge template