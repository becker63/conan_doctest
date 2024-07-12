script_folder="/Users/becker/Linux/testing/conan_doctest/test_package/build/apple-clang-15-armv8-17-debug/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-debug-armv8.sh"
for v in PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-debug-armv8.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanrunenv-debug-armv8.sh"
    fi
done


export PATH="/Users/becker/.conan2/p/cmakee847bd239a979/p/CMake.app/Contents/bin:/Users/becker/.conan2/p/b/ninja09a44cda4cfd0/p/bin:$PATH"