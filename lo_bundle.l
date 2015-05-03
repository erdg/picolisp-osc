# liblo bundle functions

(de lo-bundle-new (TT)) # Timetag

(de lo-bundle-incref (BUNDLE))

(de lo-bundle-add-message (BUNDLE PATH MSG))

(de lo-bundle-add-bundle (BUNDLE NEW))

(de lo-bundle-length (BUNDLE))

(de lo-bundle-count (BUNDLE))

(de lo-bundle-get-type (BUNDLE INDEX))

(de lo-bundle-get-bundle (BUNDLE INDEX))

(de lo-bundle-get-message (BUNDLE INDEX PATH))

(de lo-bundle-get-timestamp (BUNDLE))

(de lo-bundle-serialise ())

(de lo-bundle-free (BUNDLE))

(de lo-bundle-free-recursive (BUNDLE))

(de lo-bundle-free-messages (BUNDLE))


