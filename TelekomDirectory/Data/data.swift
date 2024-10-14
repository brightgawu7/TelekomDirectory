//
//  data.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//
import Foundation

let mockEmployee: Employee = Employee(
    id: UUID(),
    name: "Alice Marie Johnson",
    position: "Senior Data Analyst",
    employeeType: .external,
    address: Address(
        office: "Telekom Deutschland GmbH",
        country: "Germany",
        street: "Friedrichstrasse 43",
        city: "Berlin"
    ),
    team: Team(
        id: UUID(),
        name: "Data Science Team"
    ),
    email: "alice.johnson@telekom.de",
    image: "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg",
    phone: "+49-30-987-6543"
)
