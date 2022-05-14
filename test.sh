rm -r tmp
cookiecutter -v -o tmp --no-input .
cd tmp/CppProject || exit
make cmake_cpp