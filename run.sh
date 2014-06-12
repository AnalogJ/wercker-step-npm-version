#WERCKER_NPM_VERSION_VERSION_TYPE=`get_option version_type`
if [ -z "$WERCKER_NPM_VERSION_VERSION_TYPE"  ]; then
    export WERCKER_NPM_VERSION_VERSION_TYPE="patch";
fi

#WERCKER_NPM_VERSION_VERSION_MESSAGE=`get_option version_message`
if [ -z "$WERCKER_NPM_VERSION_VERSION_MESSAGE"  ]; then
    export WERCKER_NPM_VERSION_VERSION_MESSAGE="Automated version bump by wercker";
fi


echo "Step1: get the latest tag in the repo"
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo " - latest tag: $LATEST_TAG"

echo "Step2: check the diff between the latest tag and the current version."
set +e
output=$(git diff $LATEST_TAG HEAD --exit-code --quiet);
if [ $? -ne 0 ]; then
 echo " - A difference exists between the current branch $WERCKER_GIT_BRANCH and tag $LATEST_TAG"
 echo "Step3: bumping version"
 #bump the version
 echo "$WERCKER_NPM_VERSION_VERSION_TYPE $WERCKER_NPM_VERSION_VERSION_MESSAGE"
 npm version $WERCKER_NPM_VERSION_VERSION_TYPE -m "$WERCKER_NPM_VERSION_VERSION_MESSAGE"
else
 echo " - No change. exiting..."
fi

echo "$output $?"

