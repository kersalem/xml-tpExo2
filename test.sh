error=false;

if xmllint --schema presentation.xsd presentation-ok.xml --noout; then
  echo 'Le test presentation-ok.xml a réussi'
else
  echo 'Le test presentation-ok.xml a échoué'
  error=true
fi

for presentationKo in presentation-ko*; do
  if xmllint --schema presentation.xsd $presentationKo --noout > /dev/null 2>&1; then
    echo "Le test $presentationKo a échoué"
    error=true
  else
    echo "Le test $presentationKo a réussi"
  fi
done

if [ "$error" = true ] ; then
  exit 1
fi
