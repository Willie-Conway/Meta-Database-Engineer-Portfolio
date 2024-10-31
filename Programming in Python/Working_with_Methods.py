# Example 1
class A:
    def a(self):
        return "Function inside A"

class B:
    def a(self):
        return "Function inside B"

class C(B, A):
    pass  # C inherits from B first, then A

# Driver code
c = C()
print(c.a())  # Calls a() from class B, since B is the first parent in the MRO

# Example 2
class A:
    def b(self):
        return "Function inside A"

class B:
    def b(self):
        return "Function inside B"

class C(A, B):
    def b(self):
        return "Function inside C"  # Overrides b() from A and B

class D(C):
    pass  # D inherits from C, which has its own b()

d = D()
print(d.b())  # Calls b() from class C, since it overrides the others

# Uncommenting the following method will change the behavior
# class C(A, B):
#     pass  # No method b() in C, so it will look for A's b()

# Example 3
class A:
    def c(self):
        return "Function inside A"

class B:
    def c(self):
        return "Function inside B"

class C(A, B):
    def c(self):
        return "Function inside C"  # Overrides c() from A and B

# Uncommenting the following lines will cause a MRO error
# class D(A, C):  # Error occurs because C inherits A
#     pass

# Example 4
class A:
    def d(self):
        return "Function inside A"

class B:
    def d(self):
        return "Function inside B"

class C:
    def d(self):
        return "Function inside C"

class D(A, B):
    def d(self):
        return "Function inside D"

class E(B, C):
    def d(self):
        return "Function inside E"

class F(E, D, C):
    pass  # F inherits from E, D, and C in that order

f = F()
print(f.d())  # Calls d() from class E, since E is the first parent in MRO
print(F.mro())  # Prints the method resolution order for class F
