# SPARX HUB PRO — setup guide

This is a mobile-friendly study dashboard. It uses Supabase Authentication for accounts and a Supabase database table for each user's homework list.

## Important limits
- This is an independent study companion, not an official Sparx product.
- It does **not** read your Sparx account, collect your Sparx password, scrape assignments, or auto-submit homework.
- Add assignments by copying the title, subject and due date from Sparx. Paste individual questions into the helper for step-by-step explanations.
- The page's username/password account is a real Supabase Auth account. Supabase handles password storage and authentication.

## 1. Create a Supabase project
1. Open https://supabase.com/ in Chrome and create a free project.
2. In the project dashboard, open **Project Settings → API**.
3. Copy the **Project URL** and the **publishable/anon public key**.
4. In `index.html`, replace:
   - `YOUR_SUPABASE_PROJECT_URL`
   - `YOUR_SUPABASE_PUBLIC_ANON_KEY`
5. Never use a `service_role` key in browser code.

## 2. Create the homework table
In Supabase, open **SQL Editor → New query**, paste the contents of `schema.sql`, and run it.

The SQL enables Row Level Security and policies so signed-in users can only read or change their own rows.

## 3. Publish it free with GitHub Pages
1. Open https://github.com/ in Chrome and create/sign in to an account.
2. Create a new repository, for example `sparx-hub-pro`.
3. Upload `index.html` to the repository root. (You can also keep `README.md` and `schema.sql` there.)
4. In the repository, open **Settings → Pages**.
5. Under Build and deployment, choose **Deploy from a branch**, select `main` and `/ (root)`, then Save.
6. Wait for GitHub Pages to publish. It will show your website address in the Pages section.

Anyone can open the public website URL, but each person's homework data is protected by Supabase login and database Row Level Security. For a private dashboard, do not share the URL and use Supabase email confirmation. GitHub Pages itself does not make the website source private.

## 4. Recommended Supabase Auth settings
- Keep email confirmation enabled.
- Set a strong password.
- Configure the correct Site URL and redirect URL for your GitHub Pages address in **Authentication → URL Configuration**.
- Do not add a password field for Sparx. Sign into Sparx only on its official website.

## 5. Use it
1. Open your published URL in Chrome.
2. Create an account using your email and a strong password.
3. Confirm your email if prompted, then sign in.
4. Add your Maths, Science and Reader assignments.
5. Mark assignments complete when finished.
6. Paste a question into Question Helper to open a step-by-step ChatGPT prompt.

## Troubleshooting
- If you see “Finish Supabase setup first”, the URL/key placeholders in `index.html` have not been replaced correctly.
- If sign-up works but sign-in does not, check your email confirmation.
- If assignments cannot be saved, confirm `schema.sql` ran successfully and that you are signed in.
