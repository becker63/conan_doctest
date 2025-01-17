script_folder="/Users/becker/Linux/testing/conan_doctest/test_package/build/apple-clang-15-armv8-17-debug/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanbuildenv-debug-armv8.sh"
for v in 
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanbuildenv-debug-armv8.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanbuildenv-debug-armv8.sh"
    fi
done

