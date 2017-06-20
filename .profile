for PATHNAME in ~/.profile.d/*sh
    do . "$PATHNAME"
done
for PATHNAME in ~/.home-profile.d/*sh
    do . "$PATHNAME"
done
