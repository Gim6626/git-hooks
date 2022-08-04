# git-hooks

## Brief

Various useful git hooks and related scripts

Currently only one hook with two checks in presented:
1. If issue reference is presented in commit message
2. If issue reference presented in commit message matches current branch (it is assumed that work is done in issue branches only as it is very often)
 
## Example

```
$ touch foo
$ git add foo 
$ git commit -m 'foo'
ERROR: Missing issue reference in commit message
$ git commit -m 'A-1 foo'
ERROR: Issue reference in commit message does not match current branch "SDET-2691"
$ git commit -m 'SDET-2691 foo'
[SDET-2691 a97be5a] SDET-2691 foo
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo
```

## Install

1. Create file with destination directories like `target-directories`
```
/home/user/work/project1/.git/hooks/
/home/user/work/project2/.git/hooks/
```
2. Run `install.sh` script from repository directory:
```
$ ./install.sh target-directories
```
