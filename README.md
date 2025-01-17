

## Features Implemented

### User Interfaces (UI):
1. **All Users Screen**: Displays a list of all users.
2. **User Details Screen**: Shows detailed information about a specific user.
3. **All Properties Screen**: Displays a list of all properties.

### Functionality and API Endpoints:
1. **Retrieve all users**
   - **Endpoint**: `GET /users`
   - **Description**: Fetches a list of all users.

2. **Create a new user**
   - **Endpoint**: `POST /users`
   - **Description**: Adds a new user to the database.

3. **Retrieve a specific user's details**
   - **Endpoint**: `GET /users/{id}`
   - **Description**: Fetches details for a specific user by their ID.

4. **Update a specific user's details**
   - **Endpoint**: `POST /users/{id}`
   - **Description**: Updates the information for a specific user.

5. **Delete a specific user**
   - **Endpoint**: `DELETE /users/{id}`
   - **Description**: Removes a user from the database by their ID.

6. **Retrieve all properties**
   - **Endpoint**: `GET /properties`
   - **Description**: Fetches a list of all properties.

---

## Challenges Encountered

### Addressed Challenges:
1. **Handling Invalid User Data**:
   - Filtered out responses containing `null` values.
   - Parsed valid data into `UserModel` objects.

2. **CORS Issues**:
   - APIs faced Cross-Origin Resource Sharing (CORS) problems.

### Unaddressed Challenges:
1. **Poor API Documentation**:
   - Limited or unclear documentation for available endpoints.

2. **Complex UI Requirements**:
   - Some UI designs are intricate and yet to be implemented.





Live: https://catalyst-test-github-io.vercel.app/
