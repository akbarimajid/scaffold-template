.PHONY: help task-start task-complete check-task-blockers update-shadow-memory pre-commit

help:
	@echo "Available commands:"
	@echo "  make task-start N={ID}        - Start a task (renames file, updates backlog)"
	@echo "  make task-complete N={ID}     - Complete a task (renames file, updates backlog)"
	@echo "  make check-task-blockers N={ID} - Check if task dependencies are met"
	@echo "  make update-shadow-memory task={N} - Update shadow memory from completion notes"
	@echo "  make pre-commit               - Run pre-commit checks"

# Task Automation
task-start:
	@scripts/task_automation/start_task.sh $(N)

task-complete:
	@scripts/task_automation/complete_task.sh $(N)

check-task-blockers:
	@scripts/task_automation/check_blockers.sh $(N)

update-shadow-memory:
	@scripts/task_automation/update_memory.sh $(task)

pre-commit:
	pre-commit run --all-files
