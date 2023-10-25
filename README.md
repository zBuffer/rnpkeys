## INTRODUCTION

This image is written to fix [broken OpenPGP keys](https://bugzilla.mozilla.org/show_bug.cgi?id=1713621) created by older versions of Thunderbird. It is based on `ubuntu:lunar`. 

## USAGE

1. Create empty folders `input` and `output`.
2. Copy secret keys (i.e. `*.asc`) files previously exported using older versions of Thunderbird input `input` folder.
3. Run the following command:

   **On Windows**
   ```cmd
   docker run -it --rm -v .\input:/root/input -v .\output:/root/output zbuffer/rnpkeys
   ```

   **On Linux**
   ```bash
   docker run -it --rm -v ./input:/root/input -v ./output:/root/output zbuffer/rnpkeys
   ```

4. Fixed secret key files are now located in `output` folder.

## BUILDING DOCKER IMAGE

**On Windows**
```cmd
.\fix-rnpkeys.cmd
```

**On Linux**
```bash
./fix-rnpkeys.sh
```