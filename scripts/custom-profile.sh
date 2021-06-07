# The script requires arguments for original (FIND) and new (REPLACE) custom theme names
# cd into the root level of the project and run the script custom-theme.sh FIND REPLACE
# Ex. scripts/custom-profile.sh tofu yowza

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: ./$0 [find string] [replace string]"
  exit 1
fi

FIND=$1
REPLACE=$2

#needed for byte sequence error in ascii to utf conversion on OSX
export LC_CTYPE=C;
export LANG=C;

# find and replace within files
#sed -i "" is needed by the OSX version of sed (instead of sed -i)
cd web/profiles
find . -type f -exec sed -i "" "s|${FIND}|${REPLACE}|g" {} +
# rename theme folder name
rename -vs ${FIND} ${REPLACE} *
# rename file names too
cd ${REPLACE}_profile
find . -exec rename "s|${FIND}|${REPLACE}|g" {} +

exit 0
