import * as fs from 'fs/promises'
import * as fsSync from 'fs'
import * as path from 'path'
import { repoPath } from './utils.ts';

async function main() {
    const portsDir = repoPath('ports');
    const dirs = await fs.readdir(portsDir);
    for (let dir of dirs) {
        const fullUrl = path.join(portsDir, dir, 'PKGBUILD');
        if (!fsSync.existsSync(fullUrl)) {
            console.log(`Invalid ${fullUrl}`)
        }
    }
    console.log(`All path checked`)
}

main()
