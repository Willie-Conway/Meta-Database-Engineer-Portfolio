class Developer:
    """Represents a software developer."""
    
    def __init__(self, name):
        self.name = name
        self.code_changes = []
    
    def make_change(self, change):
        """Simulate making a change to the codebase."""
        self.code_changes.append(change)
        print(f"{self.name} made a change: {change}")


class VersionControlSystem:
    """Simulates a basic Version Control System."""
    
    def __init__(self):
        self.changes = []
        self.conflict_resolved = True

    def commit_changes(self, developer):
        """Commit changes made by a developer."""
        print(f"\n{developer.name} is attempting to commit changes...")
        if self.conflict_resolved:
            for change in developer.code_changes:
                self.changes.append(change)
                print(f"Committed change: {change}")
            developer.code_changes.clear()  # Clear changes after committing
        else:
            print("Conflict detected! Unable to commit changes.")

    def resolve_conflict(self):
        """Simulate conflict resolution."""
        print("Resolving conflict...")
        self.conflict_resolved = True
        print("Conflict resolved!")


class ContinuousIntegration:
    """Simulates a Continuous Integration process."""
    
    def __init__(self):
        self.build_status = "Stable"

    def run_tests(self):
        """Run tests after integrating code changes."""
        print("\nRunning tests...")
        # Simulate a successful test run
        if self.build_status == "Stable":
            print("All tests passed. Build is stable.")
        else:
            print("Tests failed. Build is unstable.")

    def build(self):
        """Simulate building the project."""
        print("Building the project...")
        self.run_tests()


class ContinuousDelivery:
    """Simulates a Continuous Delivery process."""
    
    def package_application(self):
        """Package the application for deployment."""
        print("\nPackaging the application...")
        print("Application packaged successfully!")


class ContinuousDeployment:
    """Simulates a Continuous Deployment process."""
    
    def deploy(self):
        """Deploy the application to the production environment."""
        print("\nDeploying the application to production...")
        print("Deployment successful! Application is live.")


# Example usage
if __name__ == "__main__":
    # Create developers
    dev1 = Developer("Alice")
    dev2 = Developer("Bob")

    # Developers make changes
    dev1.make_change("Add feature A")
    dev2.make_change("Fix bug in feature B")

    # Simulate version control system
    vcs = VersionControlSystem()
    
    # Commit changes
    vcs.commit_changes(dev1)
    vcs.commit_changes(dev2)

    # Simulate a conflict
    vcs.conflict_resolved = False
    vcs.commit_changes(dev1)  # Attempt to commit with unresolved conflict

    # Resolve conflict and commit again
    vcs.resolve_conflict()
    vcs.commit_changes(dev2)

    # Continuous Integration
    ci = ContinuousIntegration()
    ci.build()  # Build and run tests

    # Continuous Delivery
    cd = ContinuousDelivery()
    cd.package_application()  # Package the application for deployment

    # Continuous Deployment
    cdp = ContinuousDeployment()
    cdp.deploy()  # Deploy to production
