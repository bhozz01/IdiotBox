local old_yaw = 0.0

local fixmovement = fixmovement || nil

local function DirectionalStrafe(pCmd)
	if !fixmovement then fixmovement = pCmd:GetViewAngles() end
	fixmovement = fixmovement + Angle(pCmd:GetMouseY() * GetConVarNumber("m_pitch"), pCmd:GetMouseX() * - GetConVarNumber("m_yaw"))
	fixmovement.x = math.Clamp(fixmovement.x, - 89, 89)
    fixmovement.y = math.NormalizeAngle(fixmovement.y)
    fixmovement.z = 0
	if !LocalPlayer():IsOnGround() && pCmd:KeyDown(IN_JUMP) then
		pCmd:RemoveKey(IN_JUMP)
			local get_velocity_degree = function(velocity)
            local tmp = math.deg(math.atan(30.0 / velocity))
            if (tmp > 90.0) then
                return 90.0
            elseif (tmp < 0.0) then
                return 0.0
            else
                return tmp
            end
        end
        local M_RADPI = 57.295779513082
        local side_speed = 10000
        local velocity = LocalPlayer():GetVelocity()
        velocity.z = 0.0
        local forwardmove = pCmd:GetForwardMove()
        local sidemove = pCmd:GetSideMove()
        if (!forwardmove || !sidemove) then
            return
        end
        local flip = pCmd:TickCount() % 2 == 0
        local turn_direction_modifier = flip && 1.0 || - 1.0
        local viewangles = Angle(fixmovement.x, fixmovement.y, fixmovement.z)
        if (forwardmove || sidemove) then
            pCmd:SetForwardMove(0)
            pCmd:SetSideMove(0)
            local turn_angle = math.atan2( - sidemove, forwardmove)
            viewangles.y = viewangles.y + (turn_angle * M_RADPI)
        elseif (forwardmove) then
            pCmd:SetForwardMove(0)
        end
        local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))
        if (strafe_angle > 90) then
            strafe_angle = 90
        elseif (strafe_angle < 0) then
            strafe_angle = 0
        end
        local temp = Vector(0, viewangles.y - old_yaw, 0)
        temp.y = math.NormalizeAngle(temp.y)
        local yaw_delta = temp.y
        old_yaw = viewangles.y
        local abs_yaw_delta = math.abs(yaw_delta)
        if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
            local velocity_angles = velocity:Angle()
            temp = Vector(0, viewangles.y - velocity_angles.y, 0)
            temp.y = math.NormalizeAngle(temp.y)
            local velocityangle_yawdelta = temp.y
            local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
            if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                if ( - velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                    viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                    pCmd:SetSideMove(side_speed * turn_direction_modifier)
                else
                    viewangles.y = velocity_angles.y - velocity_degree
                    pCmd:SetSideMove(side_speed)
                end
            else
                viewangles.y = velocity_angles.y + velocity_degree
                pCmd:SetSideMove( - side_speed)
            end
        elseif (yaw_delta > 0) then
            pCmd:SetSideMove( - side_speed)
        elseif (yaw_delta < 0) then
            pCmd:SetSideMove(side_speed)
        end
        local move = Vector(pCmd:GetForwardMove(), pCmd:GetSideMove(), 0)
        local speed = move:Length()
        local angles_move = move:Angle()
		local normalized_x = math.modf(fixmovement.x + 180, 360) - 180
        local normalized_y = math.modf(fixmovement.y + 180, 360) - 180
        local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
        if (normalized_x >= 90 || normalized_x <= - 90 || fixmovement.x >= 90 && fixmovement.x <= 200 || fixmovement.x <= - 90 && fixmovement.x <= 200) then
            pCmd:SetForwardMove( - math.cos(yaw) * speed)
        else
            pCmd:SetForwardMove(math.cos(yaw) * speed)
        end
		pCmd:SetSideMove(math.sin(yaw) * speed)
	elseif pCmd:KeyDown(IN_JUMP) then
		pCmd:SetForwardMove(10000)
	end
end

hook.Add("CreateMove", "Hook20", function(pCmd)
	DirectionalStrafe(pCmd)
end)
