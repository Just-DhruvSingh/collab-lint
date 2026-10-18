# CollabLint prototype showcase

CollabLint helps campus societies resolve concrete collaboration conflicts before they agree to work together. This prototype runs in demo mode using browser-local persistence; it is not production multi-user infrastructure.

## Demo walkthrough

1. Open `/app/dashboard` and select **Prakriti Fest — Photography Collaboration**.
2. The initial sample is intentionally blocked: coverage (3 vs 2 hours), quantity (25 vs 15), delivery (24 vs 48 hours), and promotional exchange conflict.
3. In the editable terms panel set coverage to 2, photos to 15, delivery to 48, and enable the collaborative post.
4. The deterministic report changes to **ready for mutual approval**.
5. Approve as Prakriti, switch the demo perspective to Campus Photography Society, and approve the same version.
6. Open Agreements and use Print/export for a clean collaboration brief.

## Screenshots to capture

- Dashboard: operational overview and sample proposal requiring attention.
- Proposal before revision: field-level explainable feasibility conflicts.
- Proposal after revision: ready-for-approval state and distinct society approvals.
- Agreement: concise final responsibilities and print/export action.

## Limitations

The production Supabase schema, RLS policies, authentication, invite-token validation, and shared persistence remain integration work. Configure those values in `.env.local` based on `.env.example`; this app deliberately remains usable when they are absent.
