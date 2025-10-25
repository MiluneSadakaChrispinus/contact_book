"""Simple Contact Book in Jac"""

class Contact {
    def init(self: Contact, name: str, phone: str) {
        self.name = name;
        self.phone = phone;
    }

    def __str__(self: Contact) -> str {
        return f"{self.name} - {self.phone}";
    }
}

class ContactBook {
    def init(self: ContactBook) {
        self.contacts = [];
    }

    def add_contact(self: ContactBook) {
        name = input("Enter name: ");
        phone = input("Enter phone number: ");
        self.contacts.append(Contact(name, phone));
        print(f"✅ Contact {name} added successfully!");
    }

    def view_contacts(self: ContactBook) {
        if len(self.contacts) == 0 {
            print("No contacts saved yet!");
            return;
        }
        print("\n📋 Contact List:");
        for c in self.contacts {
            print(f" - {c}");
        }
    }

    def search_contact(self: ContactBook) {
        search_name = input("Enter name to search: ");
        found = False;
        for c in self.contacts {
            if c.name.lower() == search_name.lower() {
                print(f"🔍 Found: {c}");
                found = True;
            }
        }
        if not found {
            print("❌ Contact not found.");
        }
    }

    def run(self: ContactBook) {
        while True {
            print("\n--- Contact Book Menu ---");
            print("1. Add Contact");
            print("2. View Contacts");
            print("3. Search Contact");
            print("4. Exit");
            choice = input("Choose an option: ");

            if choice == "1" {
                self.add_contact();
            } elif choice == "2" {
                self.view_contacts();
            } elif choice == "3" {
                self.search_contact();
            } elif choice == "4" {
                print("👋 Exiting Contact Book. Goodbye!");
                break;
            } else {
                print("❌ Invalid option, try again.");
            }
        }
    }
}

with entry {
    app = ContactBook();
    app.run();
}
