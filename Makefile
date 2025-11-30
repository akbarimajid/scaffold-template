.PHONY: help task-start task-complete task-status check-task-blockers update-shadow-memory principal-review pre-commit
help:
	@echo "Available commands:"
	@echo "  make task-start N={ID}        - Start a task (renames file, updates backlog)"
	@echo "  make task-complete N={ID}     - Complete a task (renames file, updates backlog)"
	@echo "  make task-status N={ID}      - Show task status, file location, and blocker status"
	@echo "  make check-task-blockers N={ID} - Check if task dependencies are met"
	@echo "  make update-shadow-memory task={N} - Update shadow memory from completion notes"
	@echo "  make principal-review task={N} - Automated principal review for P0/P1 tasks"
	@echo "  make pre-commit               - Run pre-commit checks"

# Task Automation
.PHONY: task-start
task-start: ## Start a task (renames file, updates backlog)
	@if [ -z "$(N)" ]; then \
		echo "❌ Usage: make task-start N=1"; \
		echo ""; \
		echo "This command:"; \
		echo "  • Renames task from pending → in-progress"; \
		echo "  • Updates BACKLOG.md status"; \
		exit 1; \
	fi
	@bash scripts/task_automation/start_task.sh $(N)

.PHONY: task-complete
task-complete: ## Complete a task (renames file, updates backlog)
	@if [ -z "$(N)" ]; then \
		echo "❌ Usage: make task-complete N=1"; \
		echo ""; \
		echo "This command:"; \
		echo "  • Renames task from in-progress → completed"; \
		echo "  • Adds completion notes template"; \
		echo "  • Updates BACKLOG.md status"; \
		exit 1; \
	fi
	@bash scripts/task_automation/complete_task.sh $(N)

.PHONY: task-status
task-status: ## Show task status, file location, and blocker status (make task-status N=1)
	@if [ -z "$(N)" ]; then \
		echo "❌ Usage: make task-status N=1"; \
		echo ""; \
		echo "This command:"; \
		echo "  • Shows current task status (pending/in-progress/completed)"; \
		echo "  • Displays file location"; \
		echo "  • Shows blocker status if applicable"; \
		exit 1; \
	fi
	@bash scripts/task_automation/status_task.sh $(N)

.PHONY: check-task-blockers
check-task-blockers: ## Check if task blockers are complete (make check-task-blockers N=1)
	@if [ -z "$(N)" ]; then \
		echo "❌ Usage: make check-task-blockers N=1"; \
		echo ""; \
		echo "This command:"; \
		echo "  • Checks if blocker tasks are completed"; \
		echo "  • Exits 0 if ready, 1 if blocked"; \
		exit 1; \
	fi
	@bash scripts/task_automation/check_blockers.sh $(N)

.PHONY: update-shadow-memory
update-shadow-memory: ## Update shadow memory from task completion notes (make update-shadow-memory task=1)
	@if [ -z "$(task)" ]; then \
		echo "❌ Usage: make update-shadow-memory task=1"; \
		echo ""; \
		echo "This command:"; \
		echo "  • Extracts patterns and lessons from completion notes"; \
		echo "  • Appends to .ai/shadow_memory.md"; \
		exit 1; \
	fi
	@bash scripts/task_automation/update_memory.sh $(task)

.PHONY: principal-review
principal-review: ## Run principal review for P0/P1 task (make principal-review task=1)
	@if [ -z "$(task)" ]; then \
		echo "❌ Usage: make principal-review task=1"; \
		echo ""; \
		echo "This command:"; \
		echo "  • Analyzes changed files and applies review criteria"; \
		echo "  • Outputs: Auto-approve, Review required, or Block"; \
		echo "  • Exit codes: 0=approve, 1=review, 2=block"; \
		exit 1; \
	fi
	@bash scripts/task_automation/principal_review.sh $(task)

.PHONY: pre-commit
pre-commit: ## Run pre-commit checks
	@if ! command -v pre-commit >/dev/null 2>&1; then \
		echo "⚠️  pre-commit not installed. Installing..."; \
		pip install pre-commit || python3 -m pip install pre-commit || echo "❌ Failed to install pre-commit. Install manually: pip install pre-commit"; \
	fi
	@pre-commit run --all-files || (echo ""; echo "💡 To install pre-commit hooks: pre-commit install")
