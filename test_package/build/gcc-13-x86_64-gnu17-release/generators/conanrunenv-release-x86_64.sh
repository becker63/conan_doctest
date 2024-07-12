script_folder="/home/becker/mac/testing/conan_doctest/test_package/build/gcc-13-x86_64-gnu17-release/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
for v in PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
    fi
done


export PATH="/home/becker/.conan2/p/cmakeb7d33a9d18caf/p/bin:/home/becker/.conan2/p/ninja78ae65fa622a3/p/bin:$PATH"