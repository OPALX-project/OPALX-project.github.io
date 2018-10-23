Parts of the stat files of all runs should be stored into a single file such that the important data from all runs can be evaluated in post processing. The data should be supplemented with the values of the design variables. The file format for this storage should be based on hdf5 since it works well in massive parallel environment and it's already used in OPAL.

```
{ "name_x": double value,
  "name_z": string value,
  {
    "name_1": double value,
    "name_2": double value,
    "name_i": double value,
    "name_{i+1}": [double array of length N],
    "name_{i+2}": [double array of length N],
    "name_{i+j}": [double array of length N]
  },
  {
    "name_1": double value,
    "name_2": double value,
    "name_i": double value,
    "name_{i+1}": [double array of length M],
    "name_{i+2}": [double array of length M],
    "name_{i+j}": [double array of length M]
  }
}
```