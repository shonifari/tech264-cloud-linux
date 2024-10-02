# What is scripting?

- [What is scripting?](#what-is-scripting)
  - [Scripting vs Programming](#scripting-vs-programming)
  - [How to run python scripts?](#how-to-run-python-scripts)
  - [How to pass arguments to a python scripts?](#how-to-pass-arguments-to-a-python-scripts)
  - [Python script example](#python-script-example)

## Scripting vs Programming

Scripting is part of programming but differs in certain aspects:

- **COMPLEXITY**: Is simple in scripting
- **PURPOSE**: Usually to automate tasks
- **Execution:** usually by an interpreter
- **Development cycle:** usually shorter
- **Learning curve:** usually easier to learn
  
## How to run python scripts?

Scripts are ususally run through the command line

```bash
python ./script_path
```

## How to pass arguments to a python scripts?

Arguments are passed after calling a script.
The first argument will always be the python file we want to run

```bash
python ./script_path argument1 argument2
```

## Python script example

```python
import sys

argument0 = sys.argv[0]
argument1 = sys.argv[1]

print(f"Script: {argument0}")
print(f"Argument: {argument1}")

```
