VERSION_TYPE=`get_option version_type`
if [ -z "$VERSION_TYPE"  ]; then
    export VERSION_TYPE="patch";
fi

VERSION_MESSAGE=`get_option version_message`
if [ -z "$VERSION_MESSAGE"  ]; then
    export VERSION_MESSAGE="Automated version bump by wercker";
fi

echo "Step1: get the latest tag in the repo"
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
echo " - latest tag: $LATEST_TAG

echo "Step2: check the diff between the latest tag and the current version."
if [ git diff $LATEST_TAG --exit-code ];
then
 echo " - A difference exists between the current branch () and tag ($LATEST_TAG)"
 echo "Step3: bumping version"
 #bump the version
 npm version $VERSION_TYPE -m "$VERSION_MESSAGE"
else
 echo " - No change. exiting..."
fi

