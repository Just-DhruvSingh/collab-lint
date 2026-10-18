export type ApprovalState={version:number;currentVersion:number;approvals:string[];feasible:boolean;expired?:boolean;declined?:boolean};
export function canConfirm(s:ApprovalState){return s.feasible&&!s.expired&&!s.declined&&s.version===s.currentVersion&&new Set(s.approvals).size===2;}
export function registerApproval(s:ApprovalState,society:string){if(s.version!==s.currentVersion)throw new Error("Stale version cannot be approved");if(!s.feasible)throw new Error("Blocking feasibility findings remain");if(s.approvals.includes(society))return s;return {...s,approvals:[...s.approvals,society]};}
