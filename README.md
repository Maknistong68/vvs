# VVS - Vehicle Verification System

A multi-company mobile-first vehicle inspection app built with React Native (Expo) + Supabase.

## Features

- **Multi-Company Support**: Each company has isolated data with unique company codes
- **Role-Based Access Control**:
  - **Owner**: Full system access, manage all companies, promote users to admin
  - **Admin**: Manage vehicles, failure reasons, inspections, and inspectors within their company
  - **Inspector**: Create and update their own inspections, view company data
- **Vehicle Types**: Support for all kinds of moving vehicles (cars, trucks, buses, vans, motorcycles, trailers, heavy equipment, forklifts, ambulances, fire trucks, etc.)
- **Dashboard**: Statistics, failure reason charts, recent inspections
- **Full Inspection Workflow**: Create, update, track status (pending/pass/fail)

## Tech Stack

- **Frontend**: React Native + Expo
- **UI Library**: React Native Paper (Material Design 3)
- **Navigation**: Expo Router (file-based routing)
- **Backend**: Supabase (PostgreSQL + Auth + RLS)
- **Charts**: react-native-chart-kit

## Setup Instructions

### 1. Clone and Install Dependencies

```bash
cd VVS
npm install
```

### 2. Supabase Setup

1. Go to [https://supabase.com](https://supabase.com) and create a new project
2. Note your **Project URL** and **anon public key** from Settings > API
3. Go to SQL Editor and run the schema from `supabase/schema.sql`
4. Enable Email auth in Authentication > Providers

### 3. Configure Supabase Credentials

Edit `lib/supabase.ts` and replace the placeholder values:

```typescript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

### 4. Create Initial Data

In Supabase SQL Editor, create your first company:

```sql
INSERT INTO public.companies (name, code, contact_email)
VALUES ('Your Company Name', 'ACME', 'admin@yourcompany.com');
```

### 5. Create Owner Account

1. Go to Authentication > Users in Supabase dashboard
2. Create a new user with email/password
3. Copy the user's UUID from auth.users
4. Run this SQL to set them as owner:

```sql
UPDATE public.users
SET role = 'owner', company_id = 'YOUR-COMPANY-UUID'
WHERE id = 'YOUR-USER-UUID';
```

### 6. Run the App

```bash
# Start Expo development server
npm start

# Or run on specific platform
npm run android
npm run ios
npm run web
```

## Project Structure

```
VVS/
├── app/                    # Expo Router screens
│   ├── (auth)/            # Auth screens
│   │   ├── _layout.tsx
│   │   └── login.tsx
│   ├── (tabs)/            # Main tab navigation
│   │   ├── _layout.tsx
│   │   ├── index.tsx      # Dashboard
│   │   ├── inspections.tsx
│   │   ├── admin.tsx      # Admin panel
│   │   └── settings.tsx
│   ├── _layout.tsx        # Root layout
│   └── inspection/
│       └── [id].tsx       # Inspection detail/edit
├── components/
│   ├── InspectionCard.tsx
│   └── StatCard.tsx
├── lib/
│   ├── auth.tsx           # Auth context provider
│   └── supabase.ts        # Supabase client & types
├── types/
│   └── index.ts           # TypeScript interfaces
├── supabase/
│   └── schema.sql         # Database schema & RLS
└── README.md
```

## Database Schema

### Tables

- **companies**: Multi-tenant company management
- **users**: User profiles with company association
- **vehicles**: Company vehicles with type categorization
- **failure_reasons**: Customizable failure reasons per company
- **inspections**: Inspection records with status tracking

### Vehicle Types

- Car
- Truck
- Bus
- Van
- Motorcycle
- Trailer
- Heavy Equipment
- Forklift
- Ambulance
- Fire Truck
- Other

## User Roles

| Role | Companies | Users | Vehicles | Failure Reasons | Inspections |
|------|-----------|-------|----------|-----------------|-------------|
| Owner | Full CRUD | Full CRUD | Full CRUD | Full CRUD | Full CRUD |
| Admin | Read own | Read company, Update inspectors | Full CRUD (company) | Full CRUD (company) | Full CRUD (company) |
| Inspector | Read own | Read own | Read (company) | Read active (company) | Create own, Update own, Read (company) |

## New User Registration

When users sign up, they need to provide:
1. Full Name
2. Email
3. Password
4. Company Code (provided by their company admin)

New users are automatically assigned the "inspector" role.

## License

Private - All rights reserved.
