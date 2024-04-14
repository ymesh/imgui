#
# Config <imgui>
#
app_name='imgui'
app_ver="1.90.5"
branch_name="docking"

cur_dir=`pwd`
tmp_dir="tmp_${app_name}_${branch_name}_v${app_ver}"

deploy_root="/home/data/tools"
deploy_dir="${deploy_root}/ImGui/${app_name}_${branch_name}_v${app_ver}"


mkdir -p $tmp_dir
pushd $tmp_dir

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

cmake3 -L -G "Unix Makefiles" \
-DCMAKE_BUILD_TYPE="Release" \
-DCMAKE_INSTALL_PREFIX=${deploy_dir} \
../src

if [ $? -eq 0 ]
then
  echo "* "
  echo "* cmake config completed." 
  echo "* executing: \"make -C ${tmp_dir}\" (or \"make -C ${tmp_dir} install\") " 
  echo "* "
else
  echo "* "
  echo "* cmake config error!"
  echo "* "
fi
popd
