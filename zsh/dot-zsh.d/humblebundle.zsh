sort_ebooks() {
  for f in $(ls); do
    dirname="${f%.*}"
    mkdir -p "${dirname}"
    mv "${f}" "${dirname}"
  done
}

