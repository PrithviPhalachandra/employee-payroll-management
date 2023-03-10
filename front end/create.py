import streamlit as st
from database import add_data
def create():
    col1, col2 = st.columns(2)
    with col1:
        Employee_ID = st.text_input("ID: ")
        First_Name = st.text_input("First Name: ")
        Last_Name = st.text_input("Last Name: ")

    with col2:
        Hire_Date = st.text_input("Date of Hire: ")
        City = st.selectbox("Work Location (City)", ["Bengaluru", "Chennai", "Mumbai", "Hyderabad", "Jaipur", "Pune", "Kolkata"])
        State = st.selectbox("Work Location (State)", ["Karnataka", "Tamil Nadu", "Telangana", "Maharashra", "West Bengal", "Rajasthan"])

    if st.button("Add Employee Record"):
        add_data(Employee_ID, First_Name, Last_Name, Hire_Date, City, State)
    st.success("Successfully added employee record: {}".format(Employee_ID))
